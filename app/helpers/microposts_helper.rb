module MicropostsHelper
  def wrap(content)
    (content.index(' ') > 30 ) ?  wrap_long_string(content) : content
  end
  private
  def wrap_long_string(text)
   text.insert(30,' ')
   text.insert(60,' ')
   text.insert(90,' ')
   text.insert(120,' ')
    ( 1==1 ) ? text : "sujit"
  end
end

