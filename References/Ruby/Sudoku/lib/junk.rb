class Foo

    attr_reader :row

    def initialize
        @row = [[],[]]
    end

    def print_grid(tGrid)
        tGrid.each do |row|
            puts row.join(" ")
        end
    end

    def fill_row
        @row[0][0] = Bar.new
        @row[0][1] = Bar.new
        @row[1][0] = Bar.new
        @row[1][1] = Bar.new
    end

    # def print_grid(arr)

    #     butts = [[],[]]
        

    # end

    def check_arr
        butts = [[],[]]

        @row.each.with_index do |baz, rdx|
            baz.each.with_index do |item, idx|
                butts[rdx][idx] = item.show
            end
        end

        print_grid(butts)

    end


end

class Bar

    def initialize
        @item = 1
    end

    def self.show
        @item
    end

end