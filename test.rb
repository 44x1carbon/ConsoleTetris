require 'curses'

class  NCObj
	def initialize(filepath)
		File.open(filepath) do |file|
			@body = file.read
		end
		@z_index = 0
		@index = nil
		@x = 0
		@y = 0
	end

	def pos()
		{"x" => @x,"y" => @y}
	end
		
	def display()
		lines = @body.split("\n")
		lines.each_index { |idx|
			lines[idx].split(/\S\s/).each { |str|
				num = str.count(" ")
				Curses.setpos(@y + idx,@x + num)
				Curses.addstr(lines[idx].gsub(" ", ""))
			}
		}
	end 
	
 	attr_accessor :body,:z_index,:index,:x,:y
end

class NCScreen
	def initialize()
		@objs = []
	end

	def addObj(object)
		if object.instance_of? NCObj then
			@objs.push(object)
		end
	end

	def display()
		@objs.each {|obj| obj.body.split("\n").each {|line| }}
	end

	attr_accessor :objs,:min
end 

Curses.init_screen

begin

b = NCObj.new("hoge1.txt")
a = NCObj.new("hoge2.txt")
a.display()
b.display()
Curses.refresh
Curses.getch()

#Curses.init_screen
#Curses.start_color
#Curses.init_pair(Curses::COLOR_BLUE,Curses::COLOR_BLUE,Curses::COLOR_BLACK) 

#begin 
#	s = Foo.new("■ ■v \n■ ■v \n").char
#	Curses.setpos(Curses.lines / 2 , Curses.cols / 2 - (s.length / 2 ))
	
#	Curses.attron(Curses.color_pair(Curses::COLOR_BLUE))
#	Curses.addstr(s)
#	Curses.attroff(Curses.color_pair(Curses::COLOR_BLUE))
#	Curses.refresh
#	Curses.getch()
ensure
	Curses.close_screen
end
