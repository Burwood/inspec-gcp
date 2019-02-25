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
require 'google/compute/property/backendservice_backends'
require 'google/compute/property/backendservice_cdn_policy'
require 'google/compute/property/backendservice_cdn_policy_cache_key_policy'
require 'google/compute/property/backendservice_connection_draining'
require 'google/compute/property/backendservice_iap'

# A provider to manage Compute Engine resources.
class BackendService < GcpResourceBase
  name 'google_compute_backend_service'
  desc 'BackendService'
  supports platform: 'gcp'

  attr_reader :affinity_cookie_ttl_sec
  attr_reader :backends
  attr_reader :cdn_policy
  attr_reader :connection_draining
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :enable_cdn
  attr_reader :health_checks
  attr_reader :id
  attr_reader :iap
  attr_reader :load_balancing_scheme
  attr_reader :name
  attr_reader :port_name
  attr_reader :protocol
  attr_reader :region
  attr_reader :session_affinity
  attr_reader :timeout_sec

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @affinity_cookie_ttl_sec = @fetched['affinityCookieTtlSec']
    @backends = GoogleInSpec::Compute::Property::BackendServiceBackendsArray.parse(@fetched['backends'])
    @cdn_policy = GoogleInSpec::Compute::Property::BackendServiceCdnPolicy.new(@fetched['cdnPolicy'])
    @connection_draining = GoogleInSpec::Compute::Property::BackendServiceConnectionDraining.new(@fetched['connectionDraining'])
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @enable_cdn = @fetched['enableCDN']
    @health_checks = @fetched['healthChecks']
    @id = @fetched['id']
    @iap = GoogleInSpec::Compute::Property::BackendServiceIap.new(@fetched['iap'])
    @load_balancing_scheme = @fetched['loadBalancingScheme']
    @name = @fetched['name']
    @port_name = @fetched['portName']
    @protocol = @fetched['protocol']
    @region = @fetched['region']
    @session_affinity = @fetched['sessionAffinity']
    @timeout_sec = @fetched['timeoutSec']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/backendServices/{{name}}'
  end
end
