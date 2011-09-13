module VotesHelper
  def visualize_results(container, proposal)
    series = proposal.breakdown.keys
    data = proposal.breakdown.values

    raw <<-EOJS
      <script type="text/javascript">
          var chart = new cuckoo.charting.Votes();
          chart.visualize("#{container}", #{series.to_json}, #{data.to_json});
      </script>
    EOJS
  end
end
