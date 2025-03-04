# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'

# A provider to manage Service Usage resources.
class ServiceUsageService < GcpResourceBase
  name 'google_project_service'
  desc 'Service'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :parent
  attr_reader :state

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @parent = @fetched['parent']
    @state = @fetched['state']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Service #{@params[:name]}"
  end

  private

  def product_url
    'https://serviceusage.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/services/{{name}}'
  end
end
