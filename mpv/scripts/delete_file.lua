local utils = require "mp.utils"

del_list = {}

function contains_item(l, i)
   for k, v in pairs(l) do
      if v == i then
         mp.osd_message("Undelete file")
         l[k] = nil
         return true
      end
   end
   mp.osd_message("Delete file")
   return false
end

function mark_delete()
   local work_dir = mp.get_property_native("working-directory")
   local file_path = mp.get_property_native("path")
   local s = file_path:find(work_dir, 0, true)
   local final_path
   if s and s == 0 then
      final_path = file_path
   else
      final_path = utils.join_path(work_dir, file_path)
   end
   if not contains_item(del_list, final_path) then
      table.insert(del_list, final_path)
   end
end

function delete(e)
   if e.reason == "quit" then
      for i, v in pairs(del_list) do
         print("deleting: "..v)
         os.remove(v)
      end
   end
end

mp.add_key_binding("shift+DEL", "delete_file", mark_delete)
mp.register_event("end-file", delete)
