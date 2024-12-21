module Arazzo
  module Parser
    def parse(path)
      raw = File.read(path)
      specification = case File.extname(path)
                      when '.json'
                        JSON.parse(raw, symbolize_names: true)
                      when '.yaml', '.yml'
                        YAML.safe_load(raw, symbolize_names: true)
                      else
                        raise "Unsupported file format: #{path}"
                      end
      Document.from_hash(specification)
    end
  end
end
