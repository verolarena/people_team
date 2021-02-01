view: reports_to {
  derived_table: {
    sql: with reportsto as (
          select
          id,
          employee_number,
          first_name,
          last_name,
          status,
          hire_date,
          job_title
          from dwh_bamboohr_employees
      )
      select
          e.id,
          e.first_name,
          e.last_name,
          e.status,
          e.hire_date,
          e.job_title,
          e.division
          concat(r.first_name,concat(' ',r.last_name)) as reports_to
       from dwh_bamboohr_employees e left join reportsto r on r.employee_number = e.supervisor_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: hire_date {
    type: time
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: reports_to {
    type: string
    sql: ${TABLE}.reports_to ;;
  }

  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      status,
      hire_date_time,
      job_title,
      reports_to
    ]
  }
}
