


let times = 0;

const syncDb = () => {
  times++;
  console.log('Tick every 5 seconds', times);
  return times;
}

module.exports = { syncDb };
