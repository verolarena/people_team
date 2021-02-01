view: bamboo_employees {
  derived_table: {
    sql: select * from dwh_bamboohr_employees
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: snapshot_date {
    type: date
    sql: ${TABLE}.snapshot_date ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: employee_number {
    type: string
    sql: ${TABLE}.employee_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: employee_name {
    sql: (CAST(${first_name} AS VARCHAR) || CAST(' ' AS VARCHAR) || CAST(${last_name} AS VARCHAR)) ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: work_email {
    type: string
    sql: ${TABLE}.work_email ;;
  }

  dimension: supervisor_id {
    type: string
    sql: ${TABLE}.supervisor_id ;;
  }

  dimension_group: hire_date {
    type: time
    sql: ${TABLE}.hire_date ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: lever_requisition_code {
    type: string
    sql: ${TABLE}.lever_requisition_code ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: job_info_date {
    type: time
    sql: ${TABLE}.job_info_date ;;
  }

  dimension_group: termination_date {
    type: time
    sql: ${TABLE}.termination_date ;;
  }

  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: office_location {
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: position_number {
    type: string
    sql: ${TABLE}.position_number ;;
  }

  set: detail {
    fields: [
      snapshot_date,
      id,
      employee_number,
      status,
      first_name,
      middle_name,
      employee_name,
      last_name,
      job_title,
      country,
      state,
      city,
      work_email,
      supervisor_id,
      hire_date_time,
      department,
      division,
      lever_requisition_code,
      gender,
      job_info_date_time,
      termination_date_time,
      entity,
      office_location,
      position_number
    ]
  }
}
