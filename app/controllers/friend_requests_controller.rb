class FriendRequestsController < ApplicationController
  def index
    matching_friend_requests = FriendRequest.all

    @list_of_friend_requests = matching_friend_requests.order({ :created_at => :desc })

    render({ :template => "friend_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_friend_requests = FriendRequest.where({ :id => the_id })

    @the_friend_request = matching_friend_requests.at(0)

    render({ :template => "friend_requests/show.html.erb" })
  end

  def create
    the_friend_request = FriendRequest.new
    the_friend_request.sender_id = params.fetch("query_sender_id")
    the_friend_request.recipient_id = params.fetch("query_recipient_id")
    the_friend_request.status = params.fetch("query_status")

    if the_friend_request.valid?
      the_friend_request.save
      redirect_to("/friend_requests", { :notice => "Friend request created successfully." })
    else
      redirect_to("/friend_requests", { :notice => "Friend request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_friend_request = FriendRequest.where({ :id => the_id }).at(0)

    the_friend_request.sender_id = params.fetch("query_sender_id")
    the_friend_request.recipient_id = params.fetch("query_recipient_id")
    the_friend_request.status = params.fetch("query_status")

    if the_friend_request.valid?
      the_friend_request.save
      redirect_to("/friend_requests/#{the_friend_request.id}", { :notice => "Friend request updated successfully."} )
    else
      redirect_to("/friend_requests/#{the_friend_request.id}", { :alert => "Friend request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friend_request = FriendRequest.where({ :id => the_id }).at(0)

    the_friend_request.destroy

    redirect_to("/friend_requests", { :notice => "Friend request deleted successfully."} )
  end
end
