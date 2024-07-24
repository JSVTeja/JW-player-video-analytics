connection: "ap_bq_looker_connection"

# include all the views
include: "/views/**/*.view.lkml"

explore: video_desc {

  join: video_stats {
    sql_on: ${video_desc.id} = ${video_stats.media_id} ;;
    type: left_outer
    relationship: many_to_many
  }
}
