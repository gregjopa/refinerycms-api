module Refinery
  module Events
    class EventsApiController < ::ApplicationController
 
      respond_to :json
 
      # GET /integration/api.json
      # GET /integration/api.js
      def index
        @events = Event.order('position ASC')
        respond_with_json(@events)
      end
 
      # GET /integration/api/1.json
      # GET /integration/api/1.js
      def show
        @event = Event.find(params[:id])
        respond_with_json(@event)
      end
 
      # POST /integration/api.json
      def create
        @event = Event.new(params[:event])

        respond_with do |format|
          if @event.save
            format.json { render json: @event, status: :created }
          else
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end     
      end
 
      # PUT /integration/api/1.json
      def update
        @event = Event.find(params[:id])
 
        respond_with do |format|
          if @event.update_attributes(params[:event])
            format.json { render json: @event, status: :ok }
          else
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end
 
      # DELETE /integration/api/1.json
      def destroy
        @event = Event.find(params[:id])
        @event.destroy
 
        respond_with do |format|
          format.json { head :no_content }
        end
      end
 
 
    protected
      
      # provides JSONP support
      def respond_with_json(item)
        respond_with do |format|
          format.json { render :json => item }
          format.js   { render :json => item, :callback => params[:callback] }
        end
      end

 
    end
  end
end
