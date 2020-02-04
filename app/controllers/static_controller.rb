class StaticController < ApplicationController
    skip_before_action :require_login, only: [:resources, :about]
    
      def about
      end
    
      def resources
      end
    
    end