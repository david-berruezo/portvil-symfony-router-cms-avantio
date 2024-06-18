/* Credits:
http://jsfiddle.net/6RMY5/29/
http://jsfiddle.net/ThinkingStiff/XXm8y/
https://stackoverflow.com/a/21826810
https://stackoverflow.com/a/11441607
*/

function dlog(...s) {
    console.log(...s)
}

// 0 = Sun, 6 = Sat
function firstDayOfMonth(date) {
    let firstDay = new Date(date.getFullYear(), date.getMonth(), 1)
    let wkday = firstDay.getDay() // 0 = Sun, 6 = Sat
    return wkday
}

function daysInMonth(date) {
    let nextMonthStart = new Date(date.getFullYear(), date.getMonth()+1, 0) // trick: day = 1..31, 0 => day before first day of month.
    return nextMonthStart.getDate() // 1..31
}

function daysInPrevMonth(date) {
    let clone = new Date(date.getTime())
    clone.setDate(0) // 0 => last day of previous month.
    return clone.getDate() // 1..31
}

// const _testDate = new Date('2017-07-05T12:00:00-03:30')
const _testDate = new Date()
let _daysInMonth = daysInMonth(_testDate)
let _firstDayOfMonth = firstDayOfMonth(_testDate) // 0 = Sun
let slotsInDay = 4 // # of events per day.
let days = {}
const dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

// populate days of this month
for (let i = 0; i < _daysInMonth; i++) {
    days[i+1] = {
        events: [],
        slots: []
    }
}

const addNamesOfDays = function () {
    let cal = document.getElementById('calendar')
    let ol = document.createElement('ol')
    ol.classList.add('names-of-weekdays')
    for (let i = 0; i < dayNames.length; i++) {
        let li = document.createElement('li')
        li.classList.add('dayName')
        li.textContent = dayNames[i]
        ol.appendChild(li)
    }
    cal.appendChild(ol)
}()

const addListOfDays = function () {
    let cal = document.getElementById('calendar')
    let ol = document.createElement('ol')
    ol.classList.add('list-of-days')
    cal.appendChild(ol)
}()

// Fillout previous month
const prevMonthEndDate = daysInPrevMonth(_testDate)
for (i = 0; i < _firstDayOfMonth; i++) {
    let box = document.querySelector('.list-of-days')
    let li = document.createElement('li')
    li.classList.add('dayInPreviousMonth')
    li.innerHTML = `<span>${prevMonthEndDate - _firstDayOfMonth + i + 1}</span>`
    box.appendChild(li)
}

// Fillout this month
for (const day in days) {
    let box = document.querySelector('.list-of-days')
    let li = document.createElement('li')
    li.classList.add('dayInThisMonth')
    li.setAttribute('data-date', `${day}`)
    li.innerHTML = `<span>${day}</span>`
    box.appendChild(li)
}

// Fill out next month--iff this month has days that bleed into the first week of next month.
if ((_firstDayOfMonth + _daysInMonth) % 7) {
    for (let i = 0; i < 7 - (_firstDayOfMonth + _daysInMonth) % 7; i++) {
        let box = document.querySelector('.list-of-days')
        let li = document.createElement('li')
        li.classList.add('dayInNextMonth')
        li.innerHTML = `<span>${i+1}</span>`
        box.appendChild(li)
    }
}

var events = [
    {
        title: 'Facebook Post',
        etype: 'fb',
        from: 3,
        to: 5
    },
    {
        title: 'Linkedin Post',
        etype: 'li',
        from: 4,
        to: 4
    },
    {
        title: 'Instagram Post',
        etype: 'ig',
        from: 9,
        to: 10
    },
    {
        title: 'Google+ Post',
        etype: 'g+',
        from: 8,
        to: 9
    },
    {
        title: 'Twitter Post',
        etype: 'tw',
        from: 4,
        to: 10
    },
    {
        title: 'Pinterest',
        etype: 'pn',
        from: 5,
        to: 7
    },
    {
        title: 'Wordpress',
        etype: 'wp',
        from: 11,
        to: 14
    },
    {
        title: 'Facebook',
        etype: 'fb',
        from: 10,
        to: 12
    },
    {
        title: 'Instagram',
        etype: 'ig',
        from: 10,
        to: 10
    },
    {
        title: 'Pinterest',
        etype: 'pn',
        from: 13,
        to: 14
    },
    {
        title: 'Instagram',
        etype: 'ig',
        from: 13,
        to: 13
    },
    {
        title: 'Twitter',
        etype: 'tw',
        from: 13,
        to: 13
    },
    {
        title: 'Twitter',
        etype: 'tw',
        from: 13,
        to: 14
    },
];

const config = {
    eventHeight: 24, // px
    topOffset: 20, // px
    spaceBetween: 2, // px
    etypes: {
        'fb': {
            color: '#3b5998',
            icon: 'icon-facebook',
        },
        'tw': {
            color: '#1da1f2',
            icon: 'icon-twitter',
        },
        'ig': {
            color: '#c32aa3',
            icon: 'icon-instagram',
        },
        'li': {
            color: '#007bb5',
            icon: 'icon-linkedin2',
        },
        'g+': {
            color: '#db4437',
            icon: 'icon-google-plus',
        },
        'pn': {
            color: '#bd081c',
            icon: 'icon-pinterest2',
        },
        'wp': {
            color: '#277699',
            icon: 'icon-wordpress',
        },
    },
    /*
    eventIcons: {
      // <event-type> : <svg-symbol-id>
      'fb': 'icon-facebook',
      'tw': 'icon-twitter',
      'ig': 'icon-instagram',
      'li': 'icon-linkedin2',
      'g+': 'icon-google-plus',
      'pn': 'icon-pinterest2',
      'wp': 'icon-wordpress',
    },
    eventColors: {
      'fb': '#3b5998',
      'tw': '#1da1f2',
      'ig': '#c32aa3',
      'li': '#007bb5',
      'g+': '#db4437',
      'pn': '#bd081c',
      'wp': '#277699',
    }
    */
}

// go through all events and copy each occurence to a day
for (var eventIndex = 0; eventIndex < events.length; eventIndex++) {
    events[eventIndex].id = eventIndex;
    for (var dayIndex = events[eventIndex].from; dayIndex <= events[eventIndex].to; dayIndex++) {
        days[dayIndex].events.push(events[eventIndex]);
    }
}

/* time to show events */

// go through each day in this month
const daysInMonth_ = document.querySelectorAll('.dayInThisMonth')
daysInMonth_.forEach((dayElem, i) => {
    // grab day's date from 'data' attribute
    const date = dayElem.getAttribute('data-date')

    // exit if this day has no events
    if (days[date].events.length == 0) { return }

    dlog(`===day-${date}===`)

    // This is an experimetal greedy approach to prevent overlapping
    // Sort all events in this day: oldest first, break ties by longest.
    const dayEventsSorted = days[date].events.sort((evt1, evt2) => {
        if (evt1.from < evt2.from) { return -1 }
        else if (evt1.from > evt2.from) { return 1 }
        else { // same start day, prioritize longest
            const evt1Len = evt1.to - evt1.from
            const evt2Len = evt2.to - evt2.from
            if (evt1Len > evt2Len) { return -1 }
            else if (evt1Len < evt2Len) { return 1}
            else { return 0 }
        }
    })
    // go through all events on this day
    // for (let evt of days[date].events) {
    for (let evt of dayEventsSorted) {

        dlog("event:")
        dlog(JSON.stringify(evt, null, 2))

        let useSlot = 0

        // if event started this day, use the first available slot
        if (evt.from == date) {
            useSlot = days[date].slots.indexOf(undefined)
            useSlot = useSlot == -1 ? days[date].slots.length : useSlot
        } else {
            dlog("Event started in a past day, so must have been previously allocated")
            // check the slots of the first day of the event to determine the event's pos.
            useSlot = days[evt.from].slots.indexOf(evt.id)

            // if we had to skip some slots, fill them with undefined
            if (days[date].slots.length < useSlot) {
                for (let i = 0; i < (useSlot - days[date].slots.length); i++) {
                    dlog(`Slot ${days[date].slots.length + i} was skipped, filling with 'undefined'`)
                    days[date].slots.push(undefined)
                }

                dlog('Day\'s slots after filling: ', days[date].slots)
            }

            if (useSlot == -1) {
                throw 'Invariant Violation: cannot find event in any slot of its start day.'
            }
        }

        dlog(`Event will be placed in slot ${useSlot}`)

        let ypos = useSlot * (config.eventHeight + config.spaceBetween)
        let eventElem = document.createElement('div')
        eventElem.style.top = `${ypos + config.topOffset}px`
        eventElem.style.backgroundColor = config.etypes[evt.etype].color
        eventElem.style.height = `${config.eventHeight}px`
        eventElem.classList.add('event')
        if (evt.from == date) { eventElem.classList.add('firstEvent') }
        if (evt.to == date) { eventElem.classList.add('lastEvent') }
        eventElem.setAttribute('data-event-id', evt.id)

        let iconElem = document.createElementNS('http://www.w3.org/2000/svg', 'svg')
        iconElem.classList.add('icon')
        iconElem.innerHTML = `<use xlink:href="#${config.etypes[evt.etype].icon}" />`
        eventElem.appendChild(iconElem)

        let titleElem = document.createElement('span')
        titleElem.textContent = evt.title
        eventElem.appendChild(titleElem)

        dayElem.appendChild(eventElem)

        dlog(`Allocating slot ${useSlot} to event ${evt.id}`)
        days[date].slots[useSlot] = evt.id

    }
})

/*
Controversial work on showing 'more' button when events overflow day.
There is no event for when the contents of a div overflow, so the
only way for now is to periodically check every day in the month
for whether its contents overflow...gross.
*/
const showOverflowBtn = function() {
    dlog('*** Periodic Check for Day Overflow ***')
    const daysInMonth = document.querySelectorAll('.list-of-days .dayInThisMonth')

    let interval = setInterval(() => {

        daysInMonth.forEach(day => {

            // first reset day, ie remove 'more' btn and show any previously hidden event.
            let moreBtn = day.querySelector('.more-btn')
            if (moreBtn) { day.removeChild(moreBtn) }
            let eventsInDay = day.querySelectorAll('.event')
            eventsInDay.forEach(evt => {
                evt.classList.remove('overflowing')
            })

            // now see if the day overflow, ie needs a 'more' btn.
            const date = day.getAttribute('data-date')
            const height = day.clientHeight
            const scrollHeight = day.scrollHeight
            const isOverflown = scrollHeight > height

            // Determine the max # of events this day can take.
            const dayCapacity = Math.floor((height - config.topOffset) / config.eventHeight)

            dlog(`day-${date}: height=${height}, scroll-height=${scrollHeight}, is-overflown=${isOverflown}, capacity=${dayCapacity}`)

            if (isOverflown) {
                dlog('Event IDs ordered by slot in day: ', days[date].slots)
                // const orderedEventIDs = days[date].slots.filter(id => id != undefined)
                const overflowingEventIDs = days[date].slots.slice(dayCapacity-1)
                dlog('Overflowing event IDs:', overflowingEventIDs)

                // BUG: crashes when day has slots with 'undefined' slots
                overflowingEventIDs.forEach(evtID => {
                    const evt = day.querySelector(`.event[data-event-id="${evtID}"]`)
                    evt.classList.add('overflowing')
                })

                let moreBtn = document.createElement('button')
                moreBtn.textContent = `${overflowingEventIDs.length} More`
                moreBtn.classList.add('more-btn')
                const ypos = (dayCapacity - 1) * (config.eventHeight + config.spaceBetween)
                moreBtn.style.top = `${ypos + config.topOffset}px`
                moreBtn.style.height = `${config.eventHeight}px`
                day.appendChild(moreBtn)
            }
        })
    }, 1000)
}()