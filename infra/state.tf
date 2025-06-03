{
  "version": 4,
  "terraform_version": "1.12.1",
  "serial": 18,
  "lineage": "21ad898e-0123-2dd8-7314-93531964c1dd",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_autoscaling_group",
      "name": "web_asg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:autoscaling:ap-south-1:520385696955:autoScalingGroup:bf1d21a3-0afc-4793-b127-5ac33e4fa96d:autoScalingGroupName/terraform-20250603165822448400000001",
            "availability_zone_distribution": [
              {
                "capacity_distribution_strategy": "balanced-best-effort"
              }
            ],
            "availability_zones": [
              "ap-south-1a",
              "ap-south-1b"
            ],
            "capacity_rebalance": false,
            "capacity_reservation_specification": [
              {
                "capacity_reservation_preference": "default",
                "capacity_reservation_target": []
              }
            ],
            "context": "",
            "default_cooldown": 300,
            "default_instance_warmup": 0,
            "desired_capacity": 2,
            "desired_capacity_type": "",
            "enabled_metrics": null,
            "force_delete": false,
            "force_delete_warm_pool": false,
            "health_check_grace_period": 300,
            "health_check_type": "EC2",
            "id": "terraform-20250603165822448400000001",
            "ignore_failed_scaling_activities": false,
            "initial_lifecycle_hook": [],
            "instance_maintenance_policy": [],
            "instance_refresh": [],
            "launch_configuration": "",
            "launch_template": [
              {
                "id": "lt-048ffaedd38950591",
                "name": "web-app-template20250603154154792600000001",
                "version": "$Latest"
              }
            ],
            "load_balancers": [],
            "max_instance_lifetime": 0,
            "max_size": 3,
            "metrics_granularity": "1Minute",
            "min_elb_capacity": null,
            "min_size": 1,
            "mixed_instances_policy": [],
            "name": "terraform-20250603165822448400000001",
            "name_prefix": "terraform-",
            "placement_group": "",
            "predicted_capacity": 0,
            "protect_from_scale_in": false,
            "service_linked_role_arn": "arn:aws:iam::520385696955:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
            "suspended_processes": null,
            "tag": [
              {
                "key": "Name",
                "propagate_at_launch": true,
                "value": "web-asg-instance"
              }
            ],
            "target_group_arns": [],
            "termination_policies": null,
            "timeouts": null,
            "traffic_source": [],
            "vpc_zone_identifier": [],
            "wait_for_capacity_timeout": "10m",
            "wait_for_elb_capacity": null,
            "warm_pool": [],
            "warm_pool_size": 0
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiZGVsZXRlIjo2MDAwMDAwMDAwMDAsInVwZGF0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_launch_template.web_app"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_launch_template",
      "name": "web_app",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:ap-south-1:520385696955:launch-template/lt-048ffaedd38950591",
            "block_device_mappings": [],
            "capacity_reservation_specification": [],
            "cpu_options": [],
            "credit_specification": [],
            "default_version": 1,
            "description": "",
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_optimized": "",
            "elastic_gpu_specifications": [],
            "elastic_inference_accelerator": [],
            "enclave_options": [],
            "hibernation_options": [],
            "iam_instance_profile": [],
            "id": "lt-048ffaedd38950591",
            "image_id": "ami-0f535a71b34f2d44a",
            "instance_initiated_shutdown_behavior": "",
            "instance_market_options": [],
            "instance_requirements": [],
            "instance_type": "t2.micro",
            "kernel_id": "",
            "key_name": "",
            "latest_version": 3,
            "license_specification": [],
            "maintenance_options": [],
            "metadata_options": [],
            "monitoring": [],
            "name": "web-app-template20250603154154792600000001",
            "name_prefix": "web-app-template",
            "network_interfaces": [],
            "placement": [],
            "private_dns_name_options": [],
            "ram_disk_id": "",
            "security_group_names": [],
            "tag_specifications": [],
            "tags": {},
            "tags_all": {},
            "update_default_version": null,
            "user_data": "IyEvYmluL2Jhc2gKeXVtIHVwZGF0ZSAteQp5dW0gaW5zdGFsbCAteSBodHRwZApzeXN0ZW1jdGwgc3RhcnQgaHR0cGQKc3lzdGVtY3RsIGVuYWJsZSBodHRwZAplY2hvICI8aDE+V2VsY29tZSB0byB0aGUgQXV0byBTY2FsaW5nIFdlYiBBcHA8L2gxPiIgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWwK",
            "vpc_security_group_ids": []
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_lb",
      "name": "app_lb",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "access_logs": [
              {
                "bucket": "",
                "enabled": false,
                "prefix": ""
              }
            ],
            "arn": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:loadbalancer/app/web-lb/e4f84009da7388b5",
            "arn_suffix": "app/web-lb/e4f84009da7388b5",
            "client_keep_alive": 3600,
            "connection_logs": [
              {
                "bucket": "",
                "enabled": false,
                "prefix": ""
              }
            ],
            "customer_owned_ipv4_pool": "",
            "desync_mitigation_mode": "defensive",
            "dns_name": "web-lb-1869608747.ap-south-1.elb.amazonaws.com",
            "dns_record_client_routing_policy": null,
            "drop_invalid_header_fields": false,
            "enable_cross_zone_load_balancing": true,
            "enable_deletion_protection": false,
            "enable_http2": true,
            "enable_tls_version_and_cipher_suite_headers": false,
            "enable_waf_fail_open": false,
            "enable_xff_client_port": false,
            "enable_zonal_shift": false,
            "enforce_security_group_inbound_rules_on_private_link_traffic": "",
            "id": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:loadbalancer/app/web-lb/e4f84009da7388b5",
            "idle_timeout": 60,
            "internal": false,
            "ip_address_type": "ipv4",
            "ipam_pools": [],
            "load_balancer_type": "application",
            "minimum_load_balancer_capacity": [],
            "name": "web-lb",
            "name_prefix": "",
            "preserve_host_header": false,
            "security_groups": [
              "sg-04c604c14f641650e"
            ],
            "subnet_mapping": [
              {
                "allocation_id": "",
                "ipv6_address": "",
                "outpost_id": "",
                "private_ipv4_address": "",
                "subnet_id": "subnet-05e8246ee8cfc2f10"
              },
              {
                "allocation_id": "",
                "ipv6_address": "",
                "outpost_id": "",
                "private_ipv4_address": "",
                "subnet_id": "subnet-0a97ef145f6b2278a"
              }
            ],
            "subnets": [
              "subnet-05e8246ee8cfc2f10",
              "subnet-0a97ef145f6b2278a"
            ],
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "vpc_id": "vpc-0a31b3ff4ffc4c104",
            "xff_header_processing_mode": "append",
            "zone_id": "ZP97RAFLXTNZK"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwLCJ1cGRhdGUiOjYwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_lb_listener",
      "name": "web_listener",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "alpn_policy": null,
            "arn": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:listener/app/web-lb/e4f84009da7388b5/f4f490c36dd6bf84",
            "certificate_arn": null,
            "default_action": [
              {
                "authenticate_cognito": [],
                "authenticate_oidc": [],
                "fixed_response": [],
                "forward": [],
                "order": 1,
                "redirect": [],
                "target_group_arn": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:targetgroup/web-tg/6e858bf522bf53b6",
                "type": "forward"
              }
            ],
            "id": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:listener/app/web-lb/e4f84009da7388b5/f4f490c36dd6bf84",
            "load_balancer_arn": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:loadbalancer/app/web-lb/e4f84009da7388b5",
            "mutual_authentication": [],
            "port": 80,
            "protocol": "HTTP",
            "routing_http_request_x_amzn_mtls_clientcert_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_issuer_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_leaf_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_subject_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_validity_header_name": null,
            "routing_http_request_x_amzn_tls_cipher_suite_header_name": null,
            "routing_http_request_x_amzn_tls_version_header_name": null,
            "routing_http_response_access_control_allow_credentials_header_value": "",
            "routing_http_response_access_control_allow_headers_header_value": "",
            "routing_http_response_access_control_allow_methods_header_value": "",
            "routing_http_response_access_control_allow_origin_header_value": "",
            "routing_http_response_access_control_expose_headers_header_value": "",
            "routing_http_response_access_control_max_age_header_value": "",
            "routing_http_response_content_security_policy_header_value": "",
            "routing_http_response_server_enabled": true,
            "routing_http_response_strict_transport_security_header_value": "",
            "routing_http_response_x_content_type_options_header_value": "",
            "routing_http_response_x_frame_options_header_value": "",
            "ssl_policy": "",
            "tags": {},
            "tags_all": {},
            "tcp_idle_timeout_seconds": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsInVwZGF0ZSI6MzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "aws_lb.app_lb",
            "aws_lb_target_group.web_tg"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_lb_target_group",
      "name": "web_tg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:targetgroup/web-tg/6e858bf522bf53b6",
            "arn_suffix": "targetgroup/web-tg/6e858bf522bf53b6",
            "connection_termination": null,
            "deregistration_delay": "300",
            "health_check": [
              {
                "enabled": true,
                "healthy_threshold": 5,
                "interval": 30,
                "matcher": "200",
                "path": "/",
                "port": "traffic-port",
                "protocol": "HTTP",
                "timeout": 5,
                "unhealthy_threshold": 2
              }
            ],
            "id": "arn:aws:elasticloadbalancing:ap-south-1:520385696955:targetgroup/web-tg/6e858bf522bf53b6",
            "ip_address_type": "ipv4",
            "lambda_multi_value_headers_enabled": false,
            "load_balancer_arns": [
              "arn:aws:elasticloadbalancing:ap-south-1:520385696955:loadbalancer/app/web-lb/e4f84009da7388b5"
            ],
            "load_balancing_algorithm_type": "round_robin",
            "load_balancing_anomaly_mitigation": "off",
            "load_balancing_cross_zone_enabled": "use_load_balancer_configuration",
            "name": "web-tg",
            "name_prefix": "",
            "port": 80,
            "preserve_client_ip": null,
            "protocol": "HTTP",
            "protocol_version": "HTTP1",
            "proxy_protocol_v2": false,
            "slow_start": 0,
            "stickiness": [
              {
                "cookie_duration": 86400,
                "cookie_name": "",
                "enabled": false,
                "type": "lb_cookie"
              }
            ],
            "tags": {},
            "tags_all": {},
            "target_failover": [
              {
                "on_deregistration": null,
                "on_unhealthy": null
              }
            ],
            "target_group_health": [
              {
                "dns_failover": [
                  {
                    "minimum_healthy_targets_count": "1",
                    "minimum_healthy_targets_percentage": "off"
                  }
                ],
                "unhealthy_state_routing": [
                  {
                    "minimum_healthy_targets_count": 1,
                    "minimum_healthy_targets_percentage": "off"
                  }
                ]
              }
            ],
            "target_health_state": [
              {
                "enable_unhealthy_connection_termination": null,
                "unhealthy_draining_interval": null
              }
            ],
            "target_type": "instance",
            "vpc_id": "vpc-0a31b3ff4ffc4c104"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA=="
        }
      ]
    }
  ],
  "check_results": null
}
