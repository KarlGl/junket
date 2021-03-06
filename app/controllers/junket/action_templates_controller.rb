require_dependency 'junket/application_controller'

class Junket::ActionTemplatesController < Junket::ApplicationController
  load_resource
  authorize_resource except: :create # kg: for some reaosn create isn't setting the sequence_template_id
  # All templates I can see
  def index
    respond @action_templates
  end

  # A single template
  def show
    respond @action_template
  end

  # Update a template
  def update
    if @action_template.update_attributes(action_template_params)
      respond(@action_template)
    else
      respond_with(@action_template.errors, status: :unprocessable_entity)
    end
  end

  # Create a template
  def create
    sequence_template_id = params[:action_template][:sequence_template_id]
    @action_template.sequence_template_id = sequence_template_id
    authorize! :create, @action_template
    if @action_template.save
      respond @action_template
    else
      respond_with(@action_template.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    @action_template.destroy
    respond @action_template
  end

  private

  def respond(action_templates)
    if action_templates.is_a? ActiveRecord::Relation
      respond_with(action_templates, each_serializer: Junket::ActionTemplateSerializer, root: :action_templates)
    else
      respond_with(action_templates, serializer: Junket::ActionTemplateSerializer, root: :action_template)
    end
  end

  def action_template_params
    params.require(:action_template).permit(:id, :name, :send_email, :email_subject, :email_body, :send_sms, :sms_body, :type, :run_datetime)
  end
end
