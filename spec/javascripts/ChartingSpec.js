describe("Votes chart", function() {
  var chart;

  describe("by default", function() {
    beforeEach(function() {
      chart = new cuckoo.charting.Votes();
    });

    it("width is 420", function() {
      expect(chart.width).toEqual(420);
    });

    it("bar width is 20", function() {
      expect(chart.barWidth).toEqual(20);
    });

    it("bar padding is 10", function() {
      expect(chart.barPadding).toEqual(10);
    });

    it("padding left is 40", function() {
      expect(chart.paddingLeft).toEqual(40);
    });

    it("padding right is 40", function() {
      expect(chart.paddingRight).toEqual(40);
    });

    it("padding top is 20", function() {
      expect(chart.paddingTop).toEqual(20);
    });

    it("padding bottom is 20", function() {
      expect(chart.paddingBottom).toEqual(20);
    });
  });

  describe("geometry", function() {
    var data;

    beforeEach(function() {
      chart = new cuckoo.charting.Votes({
        width: 360,
        barWidth: 10,
        barPadding: 5,
        paddingTop: 15,
        paddingBottom: 10,
        paddingLeft: 25,
        paddingRight: 15
      });
      sampleData = [5, 89, 35];
    });

    it("chart width is fixed", function() {
       expect(chart.width).toEqual(360);
    });

    it("chart height accounts for data set size and bar padding", function() {
      expect(chart.height(sampleData)).toEqual(50);
    });

    it("container height adds top and bottom padding", function() {
      expect(chart.containerHeight(sampleData)).toEqual(75);
    });

    it("container width adds left and right padding", function() {
      expect(chart.containerWidth(sampleData)).toEqual(400);
    });

    it("pads first bar from origin", function() {
      expect(chart.barPosition(0)).toEqual(5);
    });

    it("sets a padding between bars", function() {
      expect(chart.barPosition(1)).toEqual(20);
      expect(chart.barPosition(2)).toEqual(35);
    });
  });

  describe("reference marks", function() {
    var data;

    describe("when all data points are lower than 5", function() {
      beforeEach(function() {
         data = [3, 2];
      });

      it("sets number of marks to greatest data point value", function() {
         expect(chart.marks(data)).toEqual(3);
      });
    });

    describe("when at least one data point is greater than 5", function() {
      beforeEach(function() {
         data = [3, 89];
      });

      it("sets a maximum of 5 marks", function() {
         expect(chart.marks(data)).toEqual(5);
      });
    });
  });
});