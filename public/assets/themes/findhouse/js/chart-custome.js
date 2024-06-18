// Circle Doughnut Chart
/*
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'doughnut',
    // The data for our dataset
    data: {
        labels: [' Principal and Interest $23,565', 'HOA Dues $2,036', 'Property Taxes $1,068'],
        datasets: [{
            label: 'My First dataset',
            segmentShowStroke : true,
            segmentStrokeColor : "transparent",
            segmentStrokeWidth : 17,
            backgroundColor: ["#92d060", "#4585ff", "#fb8855"],
            data: [50, 25, 25],
            responsive: true,
            showScale: true
        }]
    },

    // Configuration options go here
    options: {}
});
*/

// LineChart Style 2
/*    
var ctx = document.getElementById('myChartweave').getContext('2d');
    var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line', // also try bar or other graph types

    // The data for our dataset
    data: {
        labels: ["Jun 2019", "Jul 2019", "Aug 2019", "Sep 2019", "Oct 2019", "Nov 2019", "Dec 2019", "Jan 2020", "Feb 2020", "Mar 2020", "Apr 2020", "May 2020"],
        // Information about the dataset
    datasets: [{
            label: "Dataset",
            backgroundColor: 'lightblue',
            borderColor: 'blue',
            data: [26.4, 39.8, 66.8, 66.4, 40.6, 55.2, 77.4, 69.8, 57.8, 76, 110.8, 142.6],
        }]
    },

    // Configuration options
    options: {
    layout: {
      padding: 10,
    },
        legend: {
            position: 'top',
        },
        title: {
            display: false,
            text: 'Precipitation in Toronto'
        },
        scales: {
            yAxes: [{
                scaleLabel: {
                    display: false,
                    labelString: 'Precipitation in mm'
                }
            }],
            xAxes: [{
                scaleLabel: {
                    display: false,
                    labelString: 'Month of the Year'
                }
            }]
        }
    }
});


// BarChart Style
var data = {
  labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
  datasets: [{
    label: "Dataset #1",
    backgroundColor: "rgba(255,99,132,0.2)",
    borderColor: "rgba(255,99,132,1)",
    borderWidth: 2,
    hoverBackgroundColor: "rgba(255,99,132,0.4)",
    hoverBorderColor: "rgba(255,99,132,1)",
    data: [65, 59, 20, 81, 56, 55, 40],
  }]
};

var options = {
  maintainAspectRatio: false,
  scales: {
    yAxes: [{
      stacked: true,
      gridLines: {
        display: true,
        color: "rgba(255,99,132,0.2)"
      }
    }],
    xAxes: [{
      gridLines: {
        display: false
      }
    }]
  }
};

Chart.Bar('chart', {
  options: options,
  data: data
});
*/