view: compliance_bamboohr {
  derived_table: {
    sql: SELECT * FROM google_sheets.people_compliance_bamboohr
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: _row {
    type: number
    sql: ${TABLE}._row ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: work_email {
    type: string
    sql: ${TABLE}.work_email ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: supervisor_id {
    type: string
    sql: ${TABLE}.supervisor_id ;;
  }

  dimension: position_number {
    type: string
    sql: ${TABLE}.position_number ;;
  }

  dimension: snapshot_date {
    type: date
    sql: ${TABLE}.snapshot_date ;;
  }

  dimension: employee_name {
    type: string
    sql: CONCAT(${TABLE}.first_name,CONCAT(' ', ${TABLE}.last_name))  ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: office_location {
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: hire_date {
    type: date
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_info_date {
    type: string
    sql: ${TABLE}.job_info_date ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: lever_requisition_code {
    type: string
    sql: ${TABLE}.lever_requisition_code ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: termination_date {
    type: string
    sql: ${TABLE}.termination_date ;;
  }

  dimension: employee_number {
    type: number
    sql: ${TABLE}.employee_number ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  set: detail {
    fields: [
      _row,
      country,
      work_email,
      gender,
      city,
      supervisor_id,
      position_number,
      snapshot_date,
      employee_name,
      last_name,
      office_location,
      hire_date,
      job_info_date,
      middle_name,
      lever_requisition_code,
      division,
      termination_date,
      employee_number,
      id,
      state,
      department,
      first_name,
      job_title,
      entity,
      status,
      _fivetran_synced_time
    ]
  }
}
