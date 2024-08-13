connection: "ap_bq_looker_connection"

# include all the views
include: "/views/**/*.view.lkml"

explore: video_stats{

  join: video_desc {
    foreign_key: video_stats.media_id
    type: left_outer
    relationship: many_to_one
  }
}
explore: web_metrics {
  view_name: metrics
  description: "Web Metrics"
  always_filter: {
   filters: [platform: "web"]
}
}
explore: app_metrics {
  view_name: metrics
  description: "App Metrics"
  always_filter: {
    filters: [platform: "app"]
  }
}
