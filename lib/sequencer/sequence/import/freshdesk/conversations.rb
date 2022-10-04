# Copyright (C) 2012-2022 Zammad Foundation, https://zammad-foundation.org/

class Sequencer::Sequence::Import::Freshdesk::Conversations < Sequencer::Sequence::Base

  def self.sequence
    [
      'Import::Freshdesk::Request',
      'Import::Freshdesk::Resources',
      'Import::Freshdesk::ModelClass',
      'Import::Freshdesk::Perform',
    ]
  end
end
