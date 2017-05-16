configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/self_destruction')

  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => 'user',
      :password => 'password',
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end
