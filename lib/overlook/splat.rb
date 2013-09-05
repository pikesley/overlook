class Splat
  def initialize c
    @styles = {
        :fontweight    => {
            :range => [
                0..900
            ]
        },
        :letterspacing => nil,
        :fontsize      => nil,
        :fontstyle     => nil,
        :verticalalign => nil,
        :colour        => nil
    }

    @c = '<span style="font-weight: 900">%s</span>' % [
        c
    ]
  end

  def to_s
    @c
  end
end