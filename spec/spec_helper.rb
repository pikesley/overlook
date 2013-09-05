require 'overlook/paragraph'

def make_paragraph text, count
  t = "%s " % [ text ] * (count - 1)
  t = "%s%s" % [ t, text ]

  /^#{t}$/
end