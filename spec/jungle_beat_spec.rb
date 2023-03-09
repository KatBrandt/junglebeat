require "rspec"
require "./lib/node"
require "./lib/linked_list"
require "./lib/jungle_beat"

describe JungleBeat do
  it "exists" do
    jb = JungleBeat.new

    expect(jb).to be_a JungleBeat
  end

  it "instansiates with a list" do
    jb = JungleBeat.new
    
    expect(jb.list).to be_a LinkedList
    expect(jb.list.count).to eq 0
    expect(jb.list.head).to be nil
  end

  it "starts with default voice and rate" do
    jb = JungleBeat.new

    expect(jb.rate).to eq 500
    expect(jb.voice).to eq "Boing"
  end

  it "can set and reset the rate" do
    jb = JungleBeat.new

    jb.set_rate!(300)

    expect(jb.rate).to eq 300

    jb.reset_rate!

    expect(jb.rate).to eq 500
  end

  it "can create one node per data string" do
    jb = JungleBeat.new

    jb.append("deep doo ditt")

    expect(jb.list.count).to eq 3
    expect(jb.list.head.data).to eq "deep"
    expect(jb.list.head.next_node.data).to eq "doo"
  end

  xit "plays the beat" do
    jb = JungleBeat.new

    jb.append("deep doo ditt woo hoo shu")

    expect(jb.list.count).to eq 6
    expect(jb).to respond_to(:play)
    expect(jb.play).to eq ""
  end

  it "returns all beats" do
    jb = JungleBeat.new
    jb.append("deep doo ditt woo hoo shu")

    expect(jb.all).to eq "deep doo ditt woo hoo shu"
  end

  it "only allows valid beats" do
    jb = JungleBeat.new

    jb.append("deep bill ditt jelly shu")
    expect(jb.list.count).to eq 3
    expect(jb.all).to eq "deep ditt shu"
  end
end