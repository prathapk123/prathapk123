# -*- coding: utf-8 -*-
"""Assignment2_Q1.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1DURl7hkATjhyzmhHX-x-W4RpbpKPsqXG
"""

import sys
class MinHeap:
  
    def __init__(self, maxsize_of_tree):
        self.maxsize_of_tree = maxsize_of_tree
        self.size = 0
        self.heap_node = [0]*(self.maxsize_of_tree + 1)
        self.heap_node[0] = -1 * sys.maxsize
        self.front_node = 1
  
    def parent_node(self, pos):
        return pos//2
  
    def left_child(self, pos):
        return 2 * pos
  
    def right_child(self, pos):
        return (2 * pos) + 1
  
    def is_leaf_node(self, pos):
        return pos*2 > self.size
  
    def swap_nodes(self, fpos, spos):
        self.heap_node[fpos], self.heap_node[spos] = self.heap_node[spos], self.heap_node[fpos]
  
    def min_heapify(self, pos):
        if not self.is_leaf_node(pos):
            if (self.heap_node[pos] > self.heap_node[self.left_child(pos)] or 
               self.heap_node[pos] > self.heap_node[self.right_child(pos)]):
  
                if self.heap_node[self.left_child(pos)] < self.heap_node[self.right_child(pos)]:
                    self.swap_nodes(pos, self.left_child(pos))
                    self.min_heapify(self.left_child(pos))
                else:
                    self.swap_nodes(pos, self.right_child(pos))
                    self.min_heapify(self.right_child(pos))
  
    def insert(self, element):
        if self.size >= self.maxsize_of_tree :
            return
        self.size+= 1
        self.heap_node[self.size] = element  
        current = self.size
        while self.heap_node[current] < self.heap_node[self.parent_node(current)]:
            self.swap_nodes(current, self.parent_node(current))
            current = self.parent_node(current)
  
    def Print(self):
        for i in range(1, (self.size//2)+1):
            print(" PARENT : "+ str(self.heap_node[i])+"-> LEFT CHILD : "+ 
                                str(self.heap_node[2 * i])+"-> RIGHT CHILD : "+
                                str(self.heap_node[2 * i + 1]))
  
    def build_min_heap(self):
  
        for pos in range(self.size//2, 0, -1):
            self.min_heapify(pos)
  
    def remove(self):  
        popped = self.heap_node[self.front_node]
        self.heap_node[self.front_node] = self.heap_node[self.size]
        self.size-= 1
        self.min_heapify(self.front_node)
        return popped
  
if __name__ == "__main__":
      
    print('The min_heap_tree is ')
    min_heap_tree = MinHeap(20)
    min_heap_tree.insert(1)
    min_heap_tree.insert(17)
    min_heap_tree.insert(22)
    min_heap_tree.insert(12)
    min_heap_tree.insert(15)
    min_heap_tree.insert(9)
    min_heap_tree.insert(11)
    min_heap_tree.insert(16)
    min_heap_tree.insert(13)
    min_heap_tree.build_min_heap()
    min_heap_tree.Print()
    print("Root node removed is" + str(min_heap_tree.remove()))
    min_heap_tree.Print()