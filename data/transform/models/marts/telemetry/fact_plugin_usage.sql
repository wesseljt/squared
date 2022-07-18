SELECT
    plugin_executions.plugin_exec_pk,
    plugin_executions.execution_id,
    plugin_executions.event_ts,
    plugin_executions.event_count,
    plugin_executions.event_source,
    plugin_executions.event_type,
    plugin_executions.cli_command,
    plugin_executions.full_struct_command,
    plugin_executions.struct_command_category,
    plugin_executions.plugin_name,
    plugin_executions.parent_name,
    plugin_executions.executable,
    plugin_executions.namespace,
    plugin_executions.pip_url,
    plugin_executions.plugin_variant,
    plugin_executions.plugin_command,
    plugin_executions.plugin_type,
    plugin_executions.plugin_category,
    plugin_executions.plugin_surrogate_key,
    plugin_executions.project_id,
    plugin_executions.env_id,
    plugin_executions.env_name,
    plugin_executions.cli_execution_exit_code,
    plugin_executions.cli_execution_time_ms,
    plugin_executions.ip_address_hash,
    plugin_executions.meltano_version,
    plugin_executions.num_cpu_cores_available,
    plugin_executions.windows_edition,
    plugin_executions.machine,
    plugin_executions.system_release,
    plugin_executions.freedesktop_id,
    plugin_executions.freedesktop_id_like,
    plugin_executions.is_dev_build,
    plugin_executions.process_hierarchy,
    plugin_executions.python_version,
    plugin_executions.client_uuid,
    plugin_executions.is_ci_environment,
    plugin_executions.num_cpu_cores,
    plugin_executions.python_implementation,
    plugin_executions.system_name,
    plugin_executions.system_version,
    plugin_executions.cli_exception_type,
    plugin_executions.cli_exception_cause,
    plugin_executions.event_states,
    plugin_executions.event_block_types,
    project_dim.first_event_at AS project_created_at,
    project_dim.is_active AS project_is_active,
    ip_address_dim.cloud_provider,
    ip_address_dim.execution_location
FROM {{ ref('plugin_executions') }}
LEFT JOIN {{ ref('project_dim') }}
    ON plugin_executions.project_id = project_dim.project_id
LEFT JOIN {{ ref('ip_address_dim') }}
    ON plugin_executions.ip_address_hash = ip_address_dim.ip_address_hash
