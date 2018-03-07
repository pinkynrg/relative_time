module RelativeTime

	VALID_SIGNS = ['-','+']
	VALID_ROUND_SIGNS = ["/","|"]
	VALID_SUBJECTS = { m: 'minute', h: 'hour', d: 'day', w: 'week', M: 'month', y: 'year'}

	def self.parse(str)
		result = false
		# checking string and putting result into groups
		temp = str.match(/^now(?:([\+-]{1})(\d+)([m|h|d|w|M|y]{1}))?(?:([\/\|]){1}([m|h|d|w|M|y]{1}))?$/)
		if (temp)
			result = DateTime.now
			op_sign = temp[1]
			op_number = temp[2]
			op_subject = temp[3]
			rnd_method = temp[4]
			rnd_subject = temp[5]
			# adding/removing time
			if (op_sign && op_number && op_subject)
				result = result.public_send(op_sign, op_number.to_i.public_send(VALID_SUBJECTS[op_subject.to_sym]))
			end
			# rounding time
			if (rnd_method && rnd_subject)
				result = result.public_send("+", 1.public_send(VALID_SUBJECTS[rnd_subject.to_sym])) if rnd_method == "|"
				result = result.public_send("beginning_of_#{VALID_SUBJECTS[rnd_subject.to_sym]}")
			end
		end
		result
	end

end
