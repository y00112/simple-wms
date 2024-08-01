import { parseTime } from './ruoyi'
/**
 * 获取当前日期
 *
 */
export function getNowDateTime() {
    const now = new Date();
		return parseTime(now, '{y}-{m}-{d}')
}

/**
 * 获取当前日期的前一天
 *
 */
export function getLastDateTime() {
    const now = new Date();
		const yesterday = new Date(now.getTime() - (24 * 60 * 60 * 1000));
		return parseTime(yesterday, '{y}-{m}-{d}')
}
