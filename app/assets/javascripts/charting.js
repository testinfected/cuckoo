var cuckoo = {};

cuckoo.charting = {};

cuckoo.charting.Votes = function(options) {
  options = jQuery.extend({
    width: 420,
    barWidth: 20,
    barPadding: 10,
    paddingLeft: 40,
    paddingTop: 20,
    paddingRight: 40,
    paddingBottom: 20
  }, options);

  jQuery.extend(this, options);
};

cuckoo.charting.Votes.prototype.height = function(data) {
  return data.length * this.barWidth + (data.length + 1) * this.barPadding;
};

cuckoo.charting.Votes.prototype.containerHeight = function(data) {
  return this.height(data) + this.paddingTop + this.paddingBottom;
};

cuckoo.charting.Votes.prototype.containerWidth = function() {
  return this.width + this.paddingLeft + this.paddingRight;
};

cuckoo.charting.Votes.prototype.barPosition = function(barIndex) {
  return barIndex * (this.barWidth + this.barPadding) + this.barPadding;
};

cuckoo.charting.Votes.prototype.visualize = function(container, series, data) {
  var chart = this.createGraphicsContainer(data);
  this.addLabels(chart, series);
  this.addReferenceLines(chart, data);
  this.addReferenceLabels(chart, data);
  this.addBars(chart, data);
  this.addBarLabels(chart, data);
  this.addYAxis(chart, data);
};

cuckoo.charting.Votes.prototype.createGraphicsContainer = function(data) {
  return d3.select(container).
      append("svg:svg")
      .attr("class", "chart")
      .attr("width", this.containerWidth())
      .attr("height", this.containerHeight(data))
      .append("svg:g")
      .attr("transform", "translate(" + this.paddingLeft + ", " + this.paddingTop + ")");
};

cuckoo.charting.Votes.prototype.addLabels = function(chart, series) {
  (function(self) {
    chart.selectAll("text.label")
        .data(series)
        .enter().append("svg:text")
        .attr("class", "label")
        .attr("x", 0)
        .attr("y", function(d, i) {
          return self.barPosition(i) + self.barWidth / 2;
        })
        .attr("dx", -3)
        .attr("dy", ".25em")
        .attr("text-anchor", "end")
        .text(String);
  })(this);
};

cuckoo.charting.Votes.prototype.marks = function(data) {
  return d3.max(data) < 5 ? d3.max(data) : 5;
};

cuckoo.charting.Votes.prototype.horizontalScale = function(data) {
  return d3.scale.linear()
      .domain([0, d3.max(data)])
      .range([0, this.width]);
};

cuckoo.charting.Votes.prototype.addReferenceLines = function(chart, data) {
  chart.selectAll("line")
      .data(this.horizontalScale(data).ticks(this.marks(data)))
      .enter().append("svg:line")
      .attr("x1", this.horizontalScale(data))
      .attr("x2", this.horizontalScale(data))
      .attr("y1", 0)
      .attr("y2", this.height(data))
      .attr("stroke", "#ccc");
};

cuckoo.charting.Votes.prototype.addReferenceLabels = function(chart, data) {
  chart.selectAll("text.rule")
      .data(this.horizontalScale(data).ticks(this.marks(data)))
      .enter().append("svg:text")
      .attr("class", "rule")
      .attr("x", this.horizontalScale(data))
      .attr("y", 0)
      .attr("dy", -3)
      .attr("text-anchor", "middle")
      .text(String);
};

cuckoo.charting.Votes.prototype.addBars = function(chart, data) {
  (function(self) {
    chart.selectAll("rect")
        .data(data)
        .enter().append("svg:rect")
        .attr("y", function(d, i) {
          return self.barPosition(i);
        })
        .attr("width", 0)
        .attr("height", self.barWidth)
        .transition()
        .duration(1000)
        .attr("width", self.horizontalScale(data));
  })(this);
};

cuckoo.charting.Votes.prototype.addBarLabels = function(chart, data) {
  var self = this;

  chart.selectAll("text.bar")
      .data(data)
      .enter().append("svg:text")
      .attr("class", "bar")
      .attr("x", this.horizontalScale(data))
      .attr("y", function(d, i) {
        return self.barPosition(i) + self.barWidth / 2;
      })
      .attr("dx", +3)
      .attr("dy", ".25em")
      .attr("text-anchor", "start")
      .text(String);
};

cuckoo.charting.Votes.prototype.addYAxis = function(chart, data) {
  chart.append("svg:line")
      .attr("y1", 0)
      .attr("y2", this.height(data))
      .attr("stroke", "#ccc");
};


