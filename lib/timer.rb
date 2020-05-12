
def timer(method, n = 5000)
  while n <= 100000 do
    array = create_array(n)
    start = Time.now
    array.send(method)
    stop = Time.now
    diff = stop - start
    puts diff, n
    n += 5000
  end
end

def create_array(number)
  Array.new(number) { rand(1..100) }
end