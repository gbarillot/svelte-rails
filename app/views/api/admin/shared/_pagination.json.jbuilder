obj = paginate(kind, per_page ||= nil)
json.pagination do
  json.current obj[:current]
  json.previous obj[:previous]
  json.next obj[:next]
  json.per_page obj[:per_page]
  json.pages obj[:pages]
  json.count obj[:count]
end
