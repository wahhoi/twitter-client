require "benchmark"
require "io/console/size"

class InvalidInputError < StandardError; end



puts "this program will show you the prime numbers up to the integer you give, but there is no guarantee to run properly when you give considerably a big number like 10 millions"

puts "Ctrl-Pauseで終了"
  puts

loop do
begin

  print "input an integer larger than 2: "; input = gets

  if !(/^[0-9]+$/ =~ input) || input.to_i <= 1
    puts "Invalid Input!!"
    raise InvalidInputError
  else

    n = input.to_i

    list01 = [2]
    list02 = []

    n = input.to_i

    list01 = [2]
    list02 = []

    msg_thread = Thread.start do
      loop do
        print "\033[2K\rcalculating"
        sleep 0.5
        print "\033[2K\rcalculating."
        sleep 0.5
        print "\033[2K\rcalculating.."
        sleep 0.5
        print "\033[2K\rcalculating..."
        sleep 0.5
        print "\033[2K\rcalculating...."
        sleep 0.5
        print "\033[2K\rcalculating....."
        sleep 0.5
      end
    end

    result = Benchmark.realtime do
      (2..n).each do |i|

        cnt = 0

        (0..(list01.length-1)).each do |k|
          if list01[k] >= Math.sqrt(i).to_i
            list02 = list01[0..k]
            break
          end
        end

        list02.each do |j|
          if i % j == 0
            cnt += 1
          end
          if cnt >= 1
            break
          end
        end

        if cnt == 0
          list01 << i
        end

      end
    end

  end

  msg_thread.kill

  puts "...OK"

  sleep 1

  list01.each_slice(IO.console_size[1]/8) do |ary|
    puts ary.to_a.join("\t")
  end

  puts "the amount of primes: #{list01.length}"
  puts "the calculation time: #{result}[s]"

rescue InvalidInputError
  retry

rescue Interrupt
  puts "\nAborted"

rescue => ex
  p ex
 
end  
end
