# DMN 完整执行流程（情形 A + 情形 B）

## 情形 A：Step 0 — Step 9

### Step 0：读取上次 Synthesis + 活跃 Thread（跨天续接）

1. 找最新的 `YYYYMMDD_DMN_Synthesis_*.md`
2. 提取：`未解问题`（本次起点）、`不要再问`（跳过列表）、`未完成提醒`
3. 扫描思考目录下最近 3 天的目录，找到所有状态为 🔄 的活跃 Thread File
4. 读取其「思考轨迹」和「当前结论」；活跃 Thread 成为本次 DMN 的优先候选起点
5. 如果没有 Synthesis 也没有活跃 Thread → 跳过，进入 Step 1

**优先级**：用户留的问题 > 活跃 Thread 续接 > Synthesis 未解问题 > DMN 自生成问题

### Step 1—9

- **Step 1**：反重复检查（今日文件名、关键词饱和、不要再问、pendingActions）
- **Step 2**：衰减窗口检查（continuousRunHours > 4h → 仅晨间简报；2–4h → 精炼模式）
- **Step 3**：向内漫游（memory、MEMORY.md、HEARTBEAT 的「今晚 DMN 问题」）
- **Step 4**：功能选择（见 SKILL 内功能路由表）
- **Step 5**：产出（Thread / 独立笔记）+ 质量自评
- **Step 6**：TPN 门控检查
- **Step 7**：Session Synthesis（必须）
- **Step 8**：不遗忘写入（memory + pendingActions）
- **Step 9**：通知（可选）
- **最后**：写触发日志

## 情形 B（继续深化）

1. 读 Synthesis 的未解问题 + 活跃 Thread
2. 反重复 + 衰减窗口
3. 追加到已有 Thread（不新建文件），选新角度深化
4. 质量自评 + TPN 门控
5. 更新当日最新 Synthesis
6. 不遗忘写入
7. 写触发日志
