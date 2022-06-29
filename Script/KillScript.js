const childProcess = require('child_process')
const exec = childProcess.exec
let cmd = process.platform === 'win32' ? 'tasklist' : 'ps aux'

let killArr = ['wwbizsrv.exe',
  'nxlggXXS.exe',
  'ZhiXin.exe',
  'zxhost.exe',
  '360huabao.exe',
  'sesvcr.exe'
]

setInterval(async () => {
  try {
    console.log('STARTTIME:		' + new Date())
    await killProcess();
    console.log('ENDTIME:		' + new Date())
  } catch (error) {
    console.log('异常：' + error)
  }
}, 3000);

function killProcess() {
  return new Promise((resolve, reject) => {
    exec(cmd, (err, stdout, stderr) => {
      if (err) reject(err)
      let processArr = stdout.split('\n');

      try {
        processArr.forEach(processItem => {
          let processMessage = processItem.trim().split(/\s+/)
          // 进程名称
          let processName = processMessage[0]
          // 进程Id
          let processId = processMessage[1]
          if (killArr.indexOf(processName) >= 0) {
            process.kill(processId)
            console.log(processName + '     ' + processId)
          }
        })
      } catch (error) {
        reject(err)
      }
      resolve();
    })
  })
}

