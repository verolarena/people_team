connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: bamboo_employees {
  join: bamboo_job_information {
    relationship: one_to_one
    sql_on: ${bamboo_employees.id} = ${bamboo_job_information.employee_id} ;;
     }
    }
explore: bamboo_employees_snapshots {}
explore: total_employees{
  join: hiring_budget_forecast {
    relationship: one_to_many
    sql_on: ${total_employees.month} = ${hiring_budget_forecast.date} ;;
  }
}
