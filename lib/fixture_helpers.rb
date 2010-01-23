def auto_increment
  @id ||= 0; @id += 1
end