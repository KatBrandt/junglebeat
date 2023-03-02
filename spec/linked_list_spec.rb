require "rspec"
require "./lib/linked_list"
require "./lib/node"

describe LinkedList do
  describe "#new" do
    it "creates a LinkedList object" do
      list = LinkedList.new 
      expect(list).to be_a LinkedList 
    end
  end

  describe "#head" do
    it "is nil by default" do
      list = LinkedList.new 

      expect(list.head).to be nil
    end 
  end

  describe "#append" do 
    it "creates a Node object to the head attribute" do
      list = LinkedList.new 
      list.append("doop")

      expect(list.head).to be_a Node
    end

    it "does not change the head node if there already is one" do
      list = LinkedList.new 
      list.append("doop")
      list.append("deep")

      expect(list.head.data).to eq "doop"
    end

    it "adds node to the last node's next_node" do
      list = LinkedList.new 
      node_1 = list.append("doop")
      node_2 = list.append("deep")

      expect(list.head.next_node).to eq node_2
      expect(list.head.next_node.data).to eq "deep"

      node_3 = list.append("dum")

      expect(list.head.next_node).to eq node_2
      expect(list.head.next_node.next_node).to eq node_3
    end
  end

  describe "#count" do
    it "counts number of nodes in list" do
      list = LinkedList.new 

      expect(list.count).to eq 0

      list.append("doop")
      expect(list.count).to eq 1

      list.append("deep")
      expect(list.count).to eq 2
    end
  end

  describe "#to_string" do
    it "returns string of data of the nodes" do 
      list = LinkedList.new 
      node_1 = list.append("doop")

      expect(list.to_string).to eq "doop"

      node_2 = list.append("deep")
      expect(list.to_string).to eq "doop deep"
    end
  end

  describe "#prepend" do
    it "adds new node to begining of list" do 
      list = LinkedList.new 
      node_1 = list.prepend("doop")

      expect(list.to_string).to eq "doop"

      node_2 = list.prepend("plop")

      expect(list.to_string).to eq "plop doop"
    end
  end

  describe "#insert" do
    it "inserts new node at given position" do
      list = LinkedList.new 
      node_1 = list.append("doop")
      node_2 = list.append("deep")
      node_3 = list.insert(1, "suu")

      expect(list.to_string).to eq "doop suu deep"

      node_4 = list.insert(2, "plop")
      expect(list.to_string).to eq "doop suu plop deep"
    end
  end
end