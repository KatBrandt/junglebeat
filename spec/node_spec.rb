require "rspec"
require "./lib/node"

describe Node do
  describe "#new" do
    it "creates a Node object" do
      node = Node.new("plop")
      
      expect(node).to be_a Node 
    end

  end
  
  describe "#data" do
    it "is created with data" do 
      node = Node.new("plop")
  
      expect(node.data).to eq "plop"
    end
  end 

  describe "#next_node" do
    it "next node nil by default" do
      node = Node.new("plop")

      expect(node.next_node).to be nil
    end

    it "can add another node" do
      node1 = Node.new("plop")
      node2 = Node.new("doop")
      node1.next_node = node2 

      expect(node1.next_node).to eq node2
    end
  end
end