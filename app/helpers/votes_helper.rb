module VotesHelper
  def results_chart(proposal)
    chart = LazyHighCharts::HighChart.new('results', :style => "width: 400px; height:200px") do |c|
      c.chart(:type => 'bar')
      c.title(:text => 'Votes Breakdown')
      c.legend(:enabled => false)
      c.x_axis(:categories => proposal.breakdown.keys, :title => { :text => 'Choice' })
      c.y_axis(:allowDecimals => false, :title => { :text => 'Votes cast' })
      c.plot_options(:bar => { :dataLabels => { :enabled => true } })
      c.series(:name => proposal.subject, :data => proposal.breakdown.values)
    end

    high_chart('results', chart) do
      "options.tooltip.formatter = function() { return '' + this.x + ': ' + Highcharts.numberFormat(this.y, 0); }"
    end
  end
end
