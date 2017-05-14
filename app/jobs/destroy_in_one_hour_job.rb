class DestroyInOneHourJob
  include SuckerPunch::Job

  def perform(message)
    message.destroy
  end
end
