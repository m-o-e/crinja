class Crinja::Function
  class Range < Function
    name "range"

    arguments({
      :start => 0,
      :stop  => 0,
      :step  => 1,
    })

    def call(arguments : Arguments)
      start = arguments[:start].to_i
      stop = arguments[:stop].to_i
      step = arguments[:step].to_i
      unless arguments.is_set?(:stop)
        stop = start
        start = arguments.default(:stop).to_i
      end

      ::Range.new(start, stop, true).step(step).to_a.map(&.as(Type))
    end
  end

  register_default Range
end
