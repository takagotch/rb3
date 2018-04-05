class UserObserver < ActiveRecord::Observer
  def after_create(model)
    Rails.logger.info("USER: #{model.id}")
  end
end

//config.active_record.observers = :user_observer

class UserObserver < ActiveRecord::Observer
  observe :user, :blog, :entry

  def after_create(model)
    Rails.logger.info(
      "#{model.class.model_name.human}: #{model.id}")
  end
end


