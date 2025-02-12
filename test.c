#include <stdio.h>
#include <stdlib.h>

#define MIN_DEGREE 2 // Minimum degree (t)

typedef struct BTreeNode {
    int *keys;                     // Array of keys
    struct BTreeNode **children;   // Array of child pointers
    int n;                         // Number of keys
    int isLeaf;                    // Is true if node is leaf
} BTreeNode;

// Create a new B-Tree node
BTreeNode *createNode(int isLeaf) {
    BTreeNode *node = (BTreeNode *)malloc(sizeof(BTreeNode));
    node->keys = (int *)malloc((2 * MIN_DEGREE - 1) * sizeof(int));
    node->children = (BTreeNode **)malloc(2 * MIN_DEGREE * sizeof(BTreeNode *));
    node->n = 0;
    node->isLeaf = isLeaf;
    return node;
}

// Split the child of a parent node
void splitChild(BTreeNode *parent, int i, BTreeNode *child) {
    BTreeNode *newChild = createNode(child->isLeaf);
    newChild->n = MIN_DEGREE - 1;

    for (int j = 0; j < MIN_DEGREE - 1; j++)
        newChild->keys[j] = child->keys[j + MIN_DEGREE];

    if (!child->isLeaf) {
        for (int j = 0; j < MIN_DEGREE; j++)
            newChild->children[j] = child->children[j + MIN_DEGREE];
    }

    child->n = MIN_DEGREE - 1;

    for (int j = parent->n; j >= i + 1; j--)
        parent->children[j + 1] = parent->children[j];

    parent->children[i + 1] = newChild;

    for (int j = parent->n - 1; j >= i; j--)
        parent->keys[j + 1] = parent->keys[j];

    parent->keys[i] = child->keys[MIN_DEGREE - 1];
    parent->n++;
}

// Insert a key into a non-full node
void insertNonFull(BTreeNode *node, int key) {
    int i = node->n - 1;

    if (node->isLeaf) {
        while (i >= 0 && key < node->keys[i]) {
            node->keys[i + 1] = node->keys[i];
            i--;
        }
        node->keys[i + 1] = key;
        node->n++;
    } else {
        while (i >= 0 && key < node->keys[i])
            i--;

        if (node->children[i + 1]->n == 2 * MIN_DEGREE - 1) {
            splitChild(node, i + 1, node->children[i + 1]);

            if (key > node->keys[i + 1])
                i++;
        }
        insertNonFull(node->children[i + 1], key);
    }
}

// Insert a key into the B-Tree
BTreeNode *insert(BTreeNode *root, int key) {
    if (root->n == 2 * MIN_DEGREE - 1) {
        BTreeNode *newRoot = createNode(0);
        newRoot->children[0] = root;
        splitChild(newRoot, 0, root);
        insertNonFull(newRoot, key);
        return newRoot;
    } else {
        insertNonFull(root, key);
        return root;
    }
}



// Find the predecessor (largest key) in a node's left child
int findPredecessor(BTreeNode *node, int i) {
    BTreeNode *cur = node->children[i];
    while (!cur->isLeaf)
        cur = cur->children[cur->n];
    return cur->keys[cur->n - 1];
}

// Find the successor (smallest key) in a node's right child
int findSuccessor(BTreeNode *node, int i) {
    BTreeNode *cur = node->children[i + 1];
    while (!cur->isLeaf)
        cur = cur->children[0];
    return cur->keys[0];
}

// Merge child node with its sibling
void mergeChildren(BTreeNode *parent, int i) {
    BTreeNode *leftChild = parent->children[i];
    BTreeNode *rightChild = parent->children[i + 1];

    leftChild->keys[MIN_DEGREE - 1] = parent->keys[i];
    for (int j = 0; j < rightChild->n; j++)
        leftChild->keys[j + MIN_DEGREE] = rightChild->keys[j];

    if (!leftChild->isLeaf) {
        for (int j = 0; j <= rightChild->n; j++)
            leftChild->children[j + MIN_DEGREE] = rightChild->children[j];
    }

    for (int j = i; j < parent->n - 1; j++)
        parent->keys[j] = parent->keys[j + 1];

    for (int j = i + 1; j < parent->n; j++)
        parent->children[j] = parent->children[j + 1];

    leftChild->n += rightChild->n + 1;
    parent->n--;

    free(rightChild);
}

// Borrow a key from a sibling
void borrowFromSibling(BTreeNode *parent, int i) {
    BTreeNode *leftChild = parent->children[i];
    BTreeNode *rightChild = parent->children[i + 1];

    if (rightChild->n > MIN_DEGREE - 1) {
        leftChild->keys[leftChild->n] = parent->keys[i];
        parent->keys[i] = rightChild->keys[0];
        for (int j = 1; j < rightChild->n; j++)
            rightChild->keys[j - 1] = rightChild->keys[j];

        if (!leftChild->isLeaf)
            leftChild->children[leftChild->n + 1] = rightChild->children[0];

        rightChild->n--;
        leftChild->n++;
    } else if (i > 0) {
        leftChild->keys[leftChild->n] = parent->keys[i - 1];
        parent->keys[i - 1] = leftChild->keys[0];
        for (int j = 0; j < rightChild->n; j++)
            leftChild->children[j] = rightChild->children[j];

        rightChild->n--;
        leftChild->n++;
    }
}

// Delete a key from a node
void deleteKey(BTreeNode *root, int key) {
    if (!root) return;

    int idx = 0;
    while (idx < root->n && root->keys[idx] < key)
        idx++;

    if (idx < root->n && root->keys[idx] == key) {
        if (root->isLeaf) {
            for (int i = idx; i < root->n - 1; i++)
                root->keys[i] = root->keys[i + 1];
            root->n--;
        } else {
            int predKey = findPredecessor(root, idx);
            root->keys[idx] = predKey;
            deleteKey(root->children[idx], predKey);
        }
    } else {
        if (root->isLeaf) {
            printf("Key not found in the tree\n");
            return;
        }

        BTreeNode *child = root->children[idx];

        if (child->n < MIN_DEGREE) {
            BTreeNode *leftSibling = (idx > 0) ? root->children[idx - 1] : NULL;
            BTreeNode *rightSibling = (idx < root->n) ? root->children[idx + 1] : NULL;

            if (leftSibling && leftSibling->n > MIN_DEGREE - 1) {
                borrowFromSibling(root, idx - 1);
            } else if (rightSibling && rightSibling->n > MIN_DEGREE - 1) {
                borrowFromSibling(root, idx);
            } else {
                if (leftSibling) {
                    mergeChildren(root, idx - 1);
                } else if (rightSibling) {
                    mergeChildren(root, idx);
                }
            }
        }

        deleteKey(child, key);
    }
}

// Print the B-Tree
void printTree(BTreeNode *node, int depth) {
    if (node) {
        for (int i = 0; i < depth; i++)
            printf("  ");
        for (int i = 0; i < node->n; i++)
            printf("%d ", node->keys[i]);
        printf("\n");

        for (int i = 0; i <= node->n; i++)
            printTree(node->children[i], depth + 1);
    }
}

int main() {
    BTreeNode *root = createNode(1);

    int keys[] = {10, 20, 5, 6, 12, 30, 7, 17};
    int n = sizeof(keys) / sizeof(keys[0]);

    for (int i = 0; i < n; i++) {
        root = insert(root, keys[i]);
    }

    printf("B-Tree structure after insertion:\n");
    printTree(root, 0);

    // Example of deletion
    printf("\nDeleting 12:\n");
    deleteKey(root, 12);
    printTree(root, 0);

    return 0;
}


