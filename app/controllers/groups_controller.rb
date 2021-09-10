class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]


def index
end

def show
end

def new
end

def create
end

def edit
end

def update
end

private

end