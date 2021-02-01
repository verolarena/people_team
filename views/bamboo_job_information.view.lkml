view: bamboo_job_information {
  derived_table: {
    sql: select * from dwh_bamboohr_job_information
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension_group: effective_date {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.effective_date ;;
  }

  dimension: position_number {
    type: string
    sql: ${TABLE}.position_number ;;
  }

  dimension: lever_requisition_code {
    type: string
    sql: ${TABLE}.lever_requisition_code ;;
  }

  set: detail {
    fields: [id, employee_id, position_number, lever_requisition_code]
  }
  }
