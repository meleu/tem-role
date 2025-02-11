class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authorize_user, except: %i[index]
  skip_before_action :authenticate_user!, only: %i[index show]

  # GET /events or /events.json
  def index
    @events = policy_scope(Event)
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_url(@event), notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /events/1/edit
  def edit
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
      redirect_to event_url(@event), notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  def authorize_user
    event = @event || Event
    authorize event
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :description, :start_time, :start_end)
  end
end
