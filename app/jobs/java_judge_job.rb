module JavaJudgeJob
  @queue = :judge

  def self.perform(job_id)
    puts "###### compile ######"
    raise 'compile error' unless system("javac #{RESULTS_DIR}/Main.java")
    puts "###### exec ######"
    raise 'runtime error' unless system("java -cp #{RESULTS_DIR} Main > #{RESULTS_DIR}/#{job_id}.log")
  end
end
