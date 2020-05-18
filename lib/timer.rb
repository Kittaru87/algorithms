require 'gchart'

def timer(my_method, n = 5000)
  times = []
  n_values = []
  while n <= 100000 do
    array = create_array(n)
    start = Time.now
    array.send(my_method)
    stop = Time.now
    diff = stop - start
    times << (diff*100)
    n_values << n
    n += 5000
  end
  puts times
  puts n_values
  plot_chart(my_method, n_values, times)
end

def create_array(number)
  array = Array.new(number) { rand(1..100) }
end

def plot_chart(my_method, n_values, times)
  puts "creating your graph..."
  line_graph = Gchart.new(
                :type => 'line',
                :size => '600x400',
                :bar_colors => ['0088FF'],
                :title => "#{my_method}",
                :bg => 'EFEFEF',
                :legend => ['time to complete'],
                :data => [n_values, times],
                :filename => "charts/line_graph_for_#{my_method}.png",
                :stacked => false,
                :legend_position => 'top',
                :axis_with_labels => [['x'], ['y']],
                :max_value => 1,
                :min_value => 0,
                :axis_labels => [["5|10|15|20|25|30|35|40|45|50|55|60|65|70|75|80|85|90|95|100"]],
            )
  line_graph.file
  puts "graph complete and saved to file!"
end