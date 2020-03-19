def profile descriptionOfBlock, &block
  puts "Beginning "+$nestingDepth[0]
  startTime = Time.now
  
  block.call
  
  duration = Time.now - startTime
  
  puts descriptionOfBlock+':  '+duration.to_s+' seconds'

  puts "a second time"

  block.call

  current = Time.now - startTime - duration

  puts descriptionOfBlock+': '+duration.to_s+' seconds'
end

def test first, someProc, message
  puts $nestingDepth[1]
  input = first % 12

  while input > 0
    someProc.call message
    input -= 1
  end

end

pretend = Proc.new do|this|
  puts $nestingDepth[2]
  puts this
end

$nestingDepth = ["large block", "smaller block", "smallest block"]

profile "test" do
  test Time.now.hour, pretend, "DONG!"
end
