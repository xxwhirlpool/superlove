class Medium < Tag
  validates :canonical, presence: { message: "^Only canonical medium tags are allowed." }

  NAME = ArchiveConfig.MEDIUM_CATEGORY_NAME

end
