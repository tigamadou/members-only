class PostsController < ApplicationController
    before_action :required_sign_in,only: [:new, :create]
    def index
    end

    def new
    end

    def create
    end
end
