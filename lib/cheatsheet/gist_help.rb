module CheatSheet
  module Help
    def helps
      @helps ||= {}
    end

    def help(name, summary, usage = nil)
      helps[name] = summary, usage ? usage.trim_indent : nil
    end
  end

  def init(&block)
    inits << block
  end

  def trim_indent
    lines = self.split("\n")
    unindent = self.split("\n").select { |s| s !~ /^\s$/ }.map { |s| s.index(/[^\s]/) || 0 }.min
    lines.map { |s| s.gsub(/^#{' ' * unindent}/, '') }.join("\n")
  end
end
